require 'active_record'
require 'pry'
require 'amatch'

def connect_to database_name
  ActiveRecord::Base.establish_connection( 
    :adapter=>"postgresql",  :database=> "RoboCotaSeguro_development",   :host => 'localhost',
    :username=>"postgres",   :password =>"postgres")
end
  
def rowcount klass
  puts "#{klass.table_name}: #{klass.count} records"
end
  
def declare_active_record_for entity_name
  eval %"
  class #{entity_name} < ActiveRecord::Base
  end
 ";

  # Isso tenta fazer o relacionamento dinamico( é claro que deve ser melhorado, código de feito em 1 hora)
  eval(entity_name).attribute_names.each do |i|
    @all_attributes << [entity_name, i] 
  end

  tables = Array.new(@table_names) 
  tables.delete(entity_name.downcase)

  comparison_result = {}
  values = @all_attributes.select {|a| a[0] == entity_name} # Isso é gambis 

  tables.each do |table| 
    values.to_a.each {|a| idx = a[1].jaro_similar(table); comparison_result.merge!({idx => [table.singularize, a]})}
  end
  
  relation = comparison_result.sort.last[0] > 0.7 ? comparison_result.sort.last[1] : nil rescue nil
  eval(entity_name).belongs_to relation[0].to_sym, foreign_key: relation[1][1] if relation
end

def as_entity_name table_name
  table_name.singularize.capitalize
end

def inflector
  # Isso talvez o usuário deva informar ou algo do genero :(

  ActiveSupport::Inflector.inflections do |inflect|
      inflect.irregular 'cotacao', 'cotacoes'
  end  
end
  
# Usuário passa database e lista de objetos para gerar, se nao passar por padrão poderia gerar todos
def report_rowcounts_for database_name
  @all_attributes = []
  
  inflector
  @table_names = ['modelos', 'veiculos', 'cotacoes', 'coberturas']
 
  connect_to database_name
  @table_names.each {
    |table| declare_active_record_for as_entity_name(table)}
  @table_names.each {
    |table| eval "rowcount #{as_entity_name(table)}"}
end

report_rowcounts_for("RoboCotaSeguro_development")
binding.pry
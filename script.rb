require 'rubygems'
require 'pry'
require 'sequel'

DB = Sequel.connect('postgres://postgres:postgres@localhost/RoboCotaSeguro_development')

cotacoes = DB[:cotacoes].select_group(:usuario_id).having{count(usuario_id) > 50}.to_hash(:usuario_id)

# Retorna usuarios que tem mais que 50 cotacoes
DB[:cotacoes].select_group(:usuario_id).join_table(:inner, :usuarios, :id=> :usuario_id).having{count(usuario_id) > 50}.to_hash(:email)

# Todos usuarios que tm cotacao
cotacoes = DB[:cotacoes].group_and_count(:usuario_id, :email).join(:usuarios, :id => :usuario_id).select(:email)

# Retorna só os usuarios do join
cotacoes = DB["select * from cotacoes join usuarios on usuarios.id = cotacoes.usuario_id limit 10"][:usuarios]
# OR
cotacoes = DB[:cotacoes].join(:usuarios, :id => :usuario_id).select(:email)

cotacoes = DB.fetch("select * from cotacoes join usuarios on usuarios.id = cotacoes.usuario_id limit 10")
cotacoes = DB["select * from cotacoes join usuarios on usuarios.id = cotacoes.usuario_id limit 10"]


a = cotacoes.first(Sequel.like(:email, "leonir"))

a = cotacoes.exclude(:tipo => 'ADMIN_LEOSOFT')
a = cotacoes.exclude(:tipo => 'ADMIN_LEOSOFT').invert # NOT

#Count de cotacoes por usuario_id
qtd = DB[:cotacoes].group_and_count(:usuario_id).all

binding.pry
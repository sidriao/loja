class Pessoa < ActiveRecord::Base
  attr_accessible :cgf, :cpf_cnpj, :data_nascimento, :fantasia, :naturalidade, :nome, :rg, :sexo, :tipo
  
  validates :cpf_cnpj, :presence => true, :uniqueness => true, :length => { :maximum => 14}
  validates :nome, :presence => true, :length => { :maximum => 100}
  before_save :seta_tipo

  def tipo_descricao
  	if self.tipo = 1
  		"Pessoa Fisica"
  	elsif self.tipo = 2 
  		"Pessoa Juridica"	
  	end	
  end 	

  private
  def seta_tipo
  	if self.cpf_cnpj.size > 11
  		self.tipo = 2
  	else
  		self.tipo = 1
  	end		
  end	

end
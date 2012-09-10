# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pessoa do
    nome "MyString"
    cpf_cnpj "MyString"
    tipo 1
    rg "MyString"
    cgf "MyString"
    data_nascimento "2012-09-06"
    sexo "MyString"
    naturalidade "MyString"
    fantasia "MyString"
  end
end

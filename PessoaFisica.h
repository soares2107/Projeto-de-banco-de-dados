
#include <string>
#include <iostream>
#ifndef PESSOAFISICA_H_
#define PESSOAFISICA_H_

class PessoaFisica {
public:
	PessoaFisica();
    PessoaFisica(std::string cpf, std::string nome, float peso, float altura){
    this->setCpf(cpf);
    this->setAltura(altura);
    this->setPeso(peso);
    this->setNome(nome);
}

	virtual ~PessoaFisica();

	float getAltura() const {
		return altura;
	}

	void setAltura(float altura) {
		if(altura<=0) throw std::string("Altura menor que zero");
		this->altura = altura;
	}

	const std::string& getCpf() const {
		return cpf;
	}

	void setCpf(const std::string& cpf) {
		if(!PessoaFisica::cpfEValido(cpf)) throw std::string("CPF invalido");
		this->cpf = cpf;
	}

	const std::string& getNome() const {
		return nome;
	}

	void setNome(const std::string& nome) {
		this->nome = nome;
	}

	float getPeso() const {
		return peso;
	}

	void setPeso(float peso) {
		if(peso<=0) throw std::string("Peso menor que zero");
		this->peso = peso;
	}

	static bool cpfEValido(std::string cpf){
		//verifica o tamanho da string
		if (cpf.size()!=11)
			return false;

		int vetorCPF[11], digit1=-1, digit2=-1;
		//converte a string em um vetor de inteiros
		for(int i=0; i<11; i++){
			vetorCPF[i] = std::stoi(cpf.substr(i,1));
		}
		//Verifica o primeiro digito
		int soma=0, mult=10;
		for(int i=0; i<9; i++){
			soma = soma + vetorCPF[i]*mult;
			mult--;
		}
		digit1 = (soma*10)%11;
		if (digit1 != vetorCPF[9])
			return false;
		//verifica o segundo digito
		soma=0;
		mult=11;
		for(int i=0; i<10; i++){
			soma = soma + vetorCPF[i]*mult;
			mult--;
		}
		digit2 = (soma*10)%11;
		if (digit2 != vetorCPF[10])
			return false;

		//verifica digitos iguais
		bool iguais = true;
		for(int i=0; i<10; i++)
			if(vetorCPF[i] != vetorCPF[i+1])
				iguais=false;
		if(iguais)
			return false;

		return true;
	}

	friend std::ostream& operator<<(std::ostream& os, const PessoaFisica& pessoa){
		os << pessoa.getCpf()<<";"<<
				pessoa.getNome()<<";"<<
				pessoa.getPeso()<<";"<<
				pessoa.getAltura();
		return os;
	}
private:
	std::string cpf;
	std::string nome;
	float peso;
	float altura;
};
#endif /* PESSOAFISICA_H_ */

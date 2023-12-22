
/*
 * PessoaFisica.cpp
 *
 *  Created on: 18/10/23
 *      Author: João Gabriel Soares
 */

#include "PessoaFisica.h"

PessoaFisica::PessoaFisica() {
	// TODO Auto-generated constructor stub
	peso=altura=0;
}

PessoaFisica::~PessoaFisica() {
	// TODO Auto-generated destructor stub
}

//============================================================================
// Name        : CadastroPessoa.cpp
// Author      : João Gabriel Soares
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <cstdlib>
#include <string>
#include <fstream>
#include <list>

using namespace std;
int menu();
PessoaFisica* constroiPessoaFisica(string linha);
int main() {
	//Estrutura de Dados de Clientes
	list<PessoaFisica*> listaClientes;
	//Ponteiro para objeto Cliente
	PessoaFisica* cliente = 0;
	//VariÃ¡veis para atributos de Cliente
	float peso, altura;
	string nome, cpf;
	//Variaveis para arquivo
	string nomeArquivo = "clientes.csv", delimitador=";", linha;

//Lendo arquivo de clientes
	ifstream arquivoi(nomeArquivo.c_str());
	if(arquivoi.fail()){
		cout<<"--Arquivo nao aberto--"<<endl;
	}
	else{
		getline(arquivoi, linha);
		while(!arquivoi.fail()){
			cliente = constroiPessoaFisica(linha);
			listaClientes.push_back(cliente);
			cliente=0;
			getline(arquivoi, linha);
		}
		arquivoi.close();
		cout<<"==Arquivo lido com sucesso=="<<endl;
	}
//Fim da leitura do arquivo

	int op=menu();
	while(op!=0){
		switch(op){
		case 1://incluir
			cout<<"Digite o cpf: ";
			cin>>cpf;
			cout<<"Digite o nome: ";
			cin.ignore();//Limpa o buffer de teclado da leitura anterior
			getline(cin, nome);
			cout<<"Digite o peso: ";
			cin>>peso;
			cout<<"Digite a altura: ";
			cin>>altura;
			try{
				cliente = new PessoaFisica(cpf, nome, peso, altura);
			}
			catch(string& msg){
				cout<<msg<<endl;
			}
			listaClientes.push_back(cliente);
			cliente=0;
			break;
		case 2://Excluir
			cout<<"Digite o cpf: ";
			cin>>cpf;
			for (auto it = listaClientes.begin(); it != listaClientes.end(); it++)
				if((*it)->getCpf()==cpf){
					cliente = *it;
					listaClientes.erase(it);//retira da lista
					delete cliente;//apaga objeto
					cliente=0;
				}
			break;
		case 3://listar
			for (auto it = listaClientes.begin(); it != listaClientes.end(); it++)
			    std::cout << **it << endl;
			break;
		case 4://Consultar
			cout<<"Digite o cpf: ";
			cin>>cpf;
			for (auto it = listaClientes.begin(); it != listaClientes.end(); it++)
				if((*it)->getCpf()==cpf){
					std::cout << **it << endl;
				}
			break;
		}
		op=menu();
	}

//Gravando o arquivo
	ofstream arquivoo(nomeArquivo.c_str());
	for (auto it = listaClientes.begin(); it != listaClientes.end(); it++)
		arquivoo << **it << endl;
	arquivoo.close();
//Fim da gravacao do arquivo

	return 0;
}
int menu(){
	cout<<"0 - Sair"<<endl;
	cout<<"1 - Incluir Cliente"<<endl;
	cout<<"2 - Excluir Cliente"<<endl;
	cout<<"3 - Listar Cliente"<<endl;
	cout<<"4 - Consultar Cliente"<<endl;
	cout<<"Digite a opcao: ";
	int op;
	cin>>op;
	return op;
}
PessoaFisica* constroiPessoaFisica(string linha){
	PessoaFisica* p = new PessoaFisica();
	string delimitador=";", atributo;
	int pos=0;

	//CPF
	atributo = linha.substr(0, linha.find(delimitador));
	p->setCpf(atributo);
	pos=12;
	linha = linha.substr(pos);
	atributo.erase();

	//Nome
	atributo = linha.substr(0, linha.find(delimitador));
	p->setNome(atributo);
	pos = atributo.length()+1;
	linha = linha.substr(pos);
	atributo.erase();

	//Peso
	atributo = linha.substr(0, linha.find(delimitador));
	float real = stof(atributo);
	p->setPeso(real);
	pos = atributo.length()+1;
	linha = linha.substr(pos);
	atributo.erase();

	//Altura
	real = stof(linha);
	p->setAltura(real);

	return p;
}


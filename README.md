# TechShop - DevOps Automation Pipeline
# Projeto da disciplina: Desenvolvimento com Devops
# Curso: Analise e desenvolvimento de sistemas
# Aluno: André Luís Mendes Leocádio

Este é o projeto de implementação de práticas DevOps para o e-commerce **TechShop**, desenvolvido com foco na automação do ciclo de desenvolvimento de software, provisionamento de infraestrutura e deploy de aplicações. A solução proposta utiliza **CI/CD**, **Infraestrutura como Código (IaC)** com **Terraform**, e **Docker** para garantir agilidade, confiabilidade e escalabilidade.

## Arquitetura

A arquitetura do sistema foi projetada para automatizar os processos de provisionamento, teste, construção e deploy da aplicação. Ela é composta por:

- **Infraestrutura como Código (IaC)** com **Terraform** para gerenciar a infraestrutura na AWS.
- **Pipeline de CI/CD** utilizando **GitHub Actions** para automação de builds, testes e deploy.
- **Contêineres Docker** para padronizar o ambiente de execução da aplicação e facilitar o deploy.

### Componentes

- **AWS VPC**: Criada para isolar a rede e garantir a comunicação segura entre os recursos.
- **Instâncias EC2**: Hospedagem da aplicação, provisionada automaticamente com Terraform.
- **Imagens Docker**: Embalagem da aplicação para deploy em qualquer ambiente compatível.

## Estrutura do Repositório

```bash
├── .github/
│   └── workflows/              # Arquivos de configuração do GitHub Actions
│       └── ci-cd.yml           # Configuração do pipeline CI/CD
├── app/                        # Código-fonte da aplicação
│   └── techshop.py
├── infra/                       # Configuração do Terraform (infraestrutura)
├── tests/                       # Testes unitários da aplicação
│   └── unit/
│       └── test_techshop.py
├── Dockerfile                  # Arquivo para construção da imagem Docker
├── requirements.txt            # Dependências do Python
├── .gitignore                  # Arquivos para ignorar no Git
└── README.md                   # Este arquivo


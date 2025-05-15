# 🛠️ AWS STACK - CI/CD com EC2 + Docker + GitHub Actions

Este repositório contém toda a infraestrutura como código (IaC) necessária para provisionar uma instância EC2 pública com Docker e Docker Compose já instalados, compatível com o Free Tier da AWS.

 CI/CD é realizado via [GitHub Actions](https://github.com/features/actions), que faz o deploy automaticamente para a EC2 após cada push na branch `main`.

---

##  Visão Geral

-  Provisionamento de VPC, Subnet pública, Route Table e Security Group
-  EC2 com acesso via SSH (`port 22`) e HTTP (`port 80`)
-  Docker e Docker Compose configurados via `UserData`
-  Deploy automatizado com GitHub Actions
-  Compatível com o Free Tier da AWS

---

## 🧱 Tecnologias Utilizadas

- **AWS CloudFormation** (infraestrutura como código)
- **Amazon EC2** (t2.micro)
- **Docker** e **Docker Compose** (plugin v2)
- **GitHub Actions** (deploy automatizado via SSH)
- **Amazon VPC** com Internet Gateway e Sub-rede pública

---

##  Estrutura

```
.
├── .github/workflows/
│   └── deploy.yml      # Workflow do GitHub Actions para fazer o deploy
├── deploy.sh           # Script que sobe o container com docker compose
└── docker-compose.yml  # Stack do WordPress (ou outro app containerizado)
```

---

## ⚙️ Como Usar

### 1. 🚀 Subir infraestrutura na AWS

- Faça login no [AWS Console](https://console.aws.amazon.com/)
- Vá em **CloudFormation > Create Stack**
- Use o [repositório}(https://github.com/IgorPeli/AWS-STACK).
- Certifique-se de já ter um par de chaves `ssh-key` criado no EC2 (ou ajuste o campo `KeyName` no template)

### 2. 🔐 Configurar secrets no GitHub

No seu repositório, vá em:

>  Settings > Secrets and variables > Actions > New repository secret

Adicione os seguintes:

| Nome           | Valor                             |
|----------------|-----------------------------------|
| `EC2_HOST`     | IP público da EC2                 |
| `EC2_SSH_KEY`  | Conteúdo da sua chave `.pem`      |

### 3.  Fazer o deploy

A cada push na branch `main`, o GitHub Actions irá:

- Enviar os arquivos via SSH para a EC2
- Executar `deploy.sh`
- Subir os containers com `docker compose`

---

##  Requisitos

- Conta na AWS (Free Tier)
- Par de chaves EC2 criado
- GitHub repo com `main` configurado
- Docker + Docker Compose no ambiente da EC2 (já incluso no template)

---

## 🧠 Autor

**Igor Peli Resende**  
📎 Repositório pessoal de infraestrutura e automação com AWS  
🔗 https://github.com/IgorPeli

---

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

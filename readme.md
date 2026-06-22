# Template de CI/CD para Projetos Backend python Flask
Este repositório serve como base automatizada para deploys de APIs/Backends em Python. Toda vez que você fizer um `git push` na branch `main` ou gerar uma tag de versão (`vX.Y.Z`), a esteira vai testar, buildar e atualizar o container no seu servidor automaticamente.

---

## Pré-requisitos

Para que a automação funcione em novos projetos, garanta que a seguintes variável está configurada:

1. **Nas Configurações Deste Repositório Específico (`Settings > Secrets > Actions`):**
   - `PORTAINER_WEBHOOK_URL`: O link do webhook gerado especificamente para a Stack deste projeto dentro do Portainer.

---

## Como a Infraestrutura deve estar no Portainer

Para que o projeto rode isolado e seguro no servidor, a sua Stack no **Portainer** deve apontar para a rede modular `dev-network`. 

Use o modelo em `docker-compose.template.yml`

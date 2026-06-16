# 📊 E-commerce Olist Data Analysis

Projeto de Análise de Dados desenvolvido a partir do dataset Brazilian E-Commerce Public Dataset by Olist (Kaggle), com o objetivo de identificar os principais fatores que impactam a receita e a satisfação dos clientes em um e-commerce.

A análise tem foco em aspectos como eficiência logística, comportamento de compra e distribuição geográfica, gerando insights que apoiam a tomada de decisões estratégicas orientadas por dados.

## 🔹 Contexto
O crescimento do e-commerce no Brasil trouxe novas oportunidades de expansão para as empresas, ao mesmo tempo em que aumentou a complexidade das operações, podendo impactar diretamente a experiência do cliente.

Nesse cenário, torna-se fundamental compreender quais fatores realmente influenciam o desempenho do negócio, tanto do ponto de vista financeiro quanto da satisfação dos clientes.

## 🔹 Problema
Apesar do alto volume de pedidos, a empresa ainda não possui clareza sobre quais fatores impulsionam a receita e influenciam a satisfação dos clientes.

Além disso, não está evidente como aspectos operacionais impactam a experiência do consumidor. Essa falta de visibilidade dificulta a tomada de decisões estratégicas baseadas em dados.

## 🔹 Pergunta de negócio
Quais fatores impactam a receita e a satisfação do cliente?

🔹 Perguntas analíticas
- Qual é a correlação entre o atraso na entrega e a nota de avaliação dos clientes?
- Qual é o ranking dos estados por receita total e qual a participação percentual (%) dos 5 principais estados no faturamento geral?
- Qual é o ranking das categorias de produtos por faturamento e qual a sua contribuição para a receita total?


## 🔹 Sobre o Dataset

O dataset contém 9 tabelas contendo informações acerca dos clientes, pedidos, vendedores, produtos e geolocalização.

📌 Tabelas
- customers
- geolocation
- order_items
- order_payments
- order_reviews
- orders
- product_category_name_translation
- products
- sellers

---

## 🛠️ Tecnologias Utilizadas
![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=sql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-FF6F00?style=for-the-badge)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)


- **SQL** & **PostgreSQL** → ETL, limpeza, transformação e modelagem dos dados
- **Power BI** & **DAX** → criação de métricas, KPIs e dashboard interativo
- **Figma** → prototipação do layout do dashboard

---

## 🔹 Arquitetura do Projeto

```
Kaggle (CSV)
     ↓
PostgreSQL (ETL + SQL)
     ↓
Power BI (DAX + Modelagem)
     ↓
Dashboard Interativo
```

Etapas:
- Extração do dataset (CSV)
- Limpeza e transformação no PostgreSQL
- Criação de colunas derivadas
- Importação para o Power BI
- Criação de medidas DAX e visuais
- Construção do dashboard final

---

## 📁 Estrutura do Projeto
```
brazilian-e-commerce-olist-analysis/
│
├── data/
│   └── olist_customers_dataset
│   └── olist_geolocation_dataset
│   └── olist_order_items_dataset
│   └── olist_order_payments_dataset
│   └── olist_order_reviews_dataset
│   └── olist_orders_dataset
│   └── olist_products_dataset
│   └── olist_sellers_dataset
│   └── product_category_name_translation
│
├── sql/
│   └── 01_create_table.sql
│   └── 02_eda.sql
│   └── 03_analysis.sql
│
├── dashboard/
│   └── dashboard_olist.pbix
│
├── docs/
│   ├── layout_dashboard_olist.png
│   ├── dashboard_print.png
│   └── dashboard.gif
│ 
└── README.md

```

---

## 🔹 ETL (PostgreSQL)

O processo de ETL foi realizado inteiramente no PostgreSQL, garantindo qualidade e consistência dos dados antes da análise.

### Principais Etapas

- Criação da tabela no PostgreSQL
- Importação do CSV (pgAdmin)
- Padronização e renomeação de colunas
- Tratamento de valores nulos
- Identificação de duplicidades
- Criação de colunas
- Geração de tabela final para análise

---

## 🔹 Dashboard (Power BI)

![Dashboard Pokémon](docs/dashboard.gif)

O dashboard foi desenvolvido com foco em análise exploratória e storytelling de dados, permitindo identificar padrões e comparações de forma intuitiva.

- Filtros disponíveis: Tipo de Pokémon, Geração e Categoria

💡 Esses filtros permitem ao usuário analisar subconjuntos específicos, como: comparar atributos apenas de Pokémon lendários, explorar diferenças entre gerações, analisar desempenho por tipo

### Página 1 - Visão Geral

![Visão Geral](docs/dashboard_page1.png)

**KPIs**
- Total de Pokémon
- Quantidade de Gerações
- Média de Base Stat Total
- % Pokémon Especiais

**Gráficos**
- Tipos Mais Comuns no Universo Pokémon  | Gráfico de Barras
- Quantidade de Pokémon por Geração | Gráfico de Colunas
- Distribuição de Pokémon por Categoria | Gráfico de Barras
- Proporção de Pokémon Mono-type e Dual-type | Gráfico de Pizza
- Distribuição de Poder Total por Geração | Gráfico Boxplot

### Página 2 - Análise de Stats

![Análise](docs/dashboard_page2.png)

**KPIs**
- % Lendário
- % Mítico
- % Regulares

**Gráficos**
- Comparação Média de Atributos por Categoria de Pokémon | Gráfico de Colunas Clusterizado
- Média de Poder Total por Categoria de Pokémon | Gráfico de Colunas
- Top 10 Pokémon mais Fortes | Gráfico de Barras
- Relação entre Ataque e Defesa dos Pokémon | Gráfico Scatter Plot

---

## 💡 Principais Insights

### Distribuição Geral

- O tipo Água é o mais comum, sendo o mais representado entre todas as gerações analisadas
- A geração 5 possui o maior número de Pokémon
- A maioria absoluta dos Pokémon são regulares/comuns (91,88%), enquanto lendários e míticos representam ~8%, confirmando sua raridade no universo pokémon
- 51% dos Pokémon são dual-type, ou seja, possuem dois tipos elementares simultaneamente, o que amplia as possibilidades estratégicas em batalha

### Evolução de Poder
- A média de Base Stat Total se mantém relativamente estável entre gerações
- Não há evidência de aumento de poder significativo

### Categorias de Pokémon
- Pokémon lendários possuem média de 643 de poder total, contra 417 dos regulares
- Míticos seguem tendência semelhante, com alto desempenho

###  Formas Alternativas
- Pokémon com múltiplas formas podem aparecer mais de uma vez em rankings
- Cada forma possui atributos próprios, impactando diretamente o desempenho
- Isso evidencia a importância de considerar granularidade na análise (nível de forma vs nível de espécie)

**Observação:** Para evitar distorções causadas por múltiplas formas de um mesmo Pokémon (ex: Mega Evoluções), algumas métricas utilizam contagem distinta baseada no número da Pokédex.

---

## 👩‍💻 Sobre mim

Sou Tecnóloga em Sistemas para Internet em transição para a área de Dados, com foco em análise de dados.

Possuo experiência com SQL (PostgreSQL), Python (Pandas) e Power BI, desenvolvendo projetos de ETL, análise exploratória (EDA) e criação de dashboards interativos.

---

🩷 Fique à vontade para explorar o projeto, dar feedback ou entrar em contato!

---
## 📫 Contato

<p align="left">
    <a href="https://www.linkedin.com/in/ana-carolina-itacarambi-araujo/" target="_blank">
      <img 
        src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" 
        alt="LinkedIn"
      />
    </a>
</p>
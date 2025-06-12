# 📱 AutoCatalogApp

Aplicativo iOS desenvolvido com SwiftUI e arquitetura MVVM para exibição de um catálogo de veículos. Possui sistema de favoritos, busca por nome e filtro por marca.

## ⚙️ Funcionalidades

- ✅ Listagem de veículos a partir de um JSON remoto.
- 🚗 Detalhes de cada carro com imagem maior, descrição e botão de favorito.
- ⭐ Tela de **favoritos** com persistência local (UserDefaults).
- 🔍 **Filtro por nome do veículo e por marca** com Picker dinâmico.
- 📱 Design adaptável e responsivo com SwiftUI.
- 📐 Lógica de negócios separada por camadas (MVVM)

## 🔧 Tecnologias usadas

- Swift 5
- SwiftUI
- MVVM
- UserDefaults
- JSON local (mock)
- AsyncImage
- TabView
- Combine
-	URLSession
- Git

## Estrutura

AutoCatalog/
├── Models/
│   └── Car.swift
├── ViewModels/
│   ├── CarListViewModel.swift
│   └── FavoritesViewModel.swift
├── Views/
│   ├── CarListView.swift
│   ├── CarDetailView.swift
│   ├── CarRowView.swift
│   └── FavoritesView.swift
├── Resources/
│   └── MockData.json
└── AutoCatalogApp.swift

### ▶️ Como rodar o projeto
1.	Clone o repositório:
git clone https://github.com/gbe-rs/AutoCatalogApp.git
2.	Abra o arquivo .xcodeproj no Xcode
3.	Compile e execute no simulador

### 📌 Observações
	•	Projeto desenvolvido para prática e demonstração de habilidades com SwiftUI moderno.
	•	Código organizado e pronto para manutenção e evolução.

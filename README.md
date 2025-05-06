# AutoCatalogApp

# AutoCatalog

Aplicativo iOS desenvolvido com SwiftUI que exibe um catálogo de carros com detalhes, imagens, favoritos e filtro por marca. Ideal para mostrar domínio de Swift moderno, arquitetura MVVM, persistência com `UserDefaults` e UI declarativa.

## Funcionalidades

- Lista de carros com imagem, marca, modelo, ano e preço.
- Detalhes de cada carro com imagem maior, descrição e botão de favorito.
- Tela de **favoritos** com persistência local.
- **Filtro por marca** com Picker dinâmico.
- Design adaptável e responsivo com SwiftUI.

## Tecnologias

- Swift 5
- SwiftUI
- MVVM
- UserDefaults
- JSON local (mock)
- AsyncImage
- TabView

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
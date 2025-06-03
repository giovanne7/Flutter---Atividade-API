💰 Aplicativo de Criptomoedas
Um aplicativo Flutter moderno que consome a API do CoinMarketCap para listar e pesquisar criptomoedas, com design responsivo, arquitetura limpa (MVVM) e atualizações em tempo real via pull-to-refresh.

✨ Funcionalidades
📊 Lista de Criptomoedas: Mostra nome, sigla e cotações em USD e BRL, com formatação de moeda.

🔍 Busca Inteligente: Permite pesquisar várias criptomoedas separadas por vírgula.

🔄 Atualização com Pull-to-Refresh: Atualize os dados facilmente com um gesto.

⏳ Indicador de Progresso: Feedback visual durante as requisições.

⚙️ Configuração
Clone o repositório:

bash
Copiar
Editar
git clone https://github.com/seu-usuario/crypto-app-flutter.git
cd crypto-app-flutter
Instale as dependências:

bash
Copiar
Editar
flutter pub get
Adicione sua chave da API CoinMarketCap:

🔑 Altere diretamente o arquivo:

lib/data/crypto_data_source.dart

Ou, use uma variável de ambiente no momento da execução:

bash
Copiar
Editar
flutter run --dart-define=COINMARKETCAP_API_KEY=sua_chave_api
Execute o app:

bash
Copiar
Editar
flutter run
📦 Dependências
Pacote	Função
http	Requisições HTTP à API
provider	Gerenciamento de estado via MVVM
intl	Formatação de moedas
pull_to_refresh	Funcionalidade de pull-to-refresh

📝 Notas
💱 A taxa de câmbio BRL/USD está fixa em 5.3. Para valores dinâmicos, substitua a função fetchBrlRate() por uma API de câmbio real.

🌐 Requer conexão com a internet para funcionar.

🧠 O projeto segue a arquitetura MVVM, separando claramente a lógica entre:

UI

ViewModel

Repository

DataSource

📁 Estrutura Recomendada
bash
Copiar
Editar
lib/
├── data/
│   └── crypto_data_source.dart
├── model/
├── repository/
├── view/
├── view_model/
└── main.dart

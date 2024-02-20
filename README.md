## Summarizer

Summarizer is a cutting-edge application powered by Google's Generative AI (Gemini), aimed at providing precise and succinct summaries of extensive textual content. It revolutionizes the consumption of digital information by enhancing productivity and facilitating efficient absorption of knowledge.

![Screenshot_20240220_102513](https://github.com/kiddo4/summarizer/assets/107349861/48b07c87-6d4c-4698-9fa2-57f6f7b90a0d) ![Screenshot_20240220_102544](https://github.com/kiddo4/summarizer/assets/107349861/c8a1be8f-ca37-4f80-96ea-d7dd00775d90)

### Key Features

- **Advanced AI Summaries**: Leveraging state-of-the-art Google Generative AI, Summarizer generates accurate summaries.
- **Intuitive Interface**: With a clean and user-friendly design, navigating and using Summarizer is effortless.

### Getting Started

#### API Keys

To utilize Summarizer, you'll need a Gemini API key. If you don't have one yet, create it in Google AI Studio: [Google AI Studio API Key](https://makersuite.google.com/app/apikey).


#### Prerequisites

- Ensure Flutter is installed on your system. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).
- An active internet connection is necessary for accessing Google's Generative AI APIs.

#### Installation Steps

1. **Clone the Repository**

   Start by cloning the Summarizer repository to your local machine using Git.

   ```bash
   git clone https://github.com/kiddo4/summarizer.git
   cd summarizer
   ```

2. **Install Dependencies**

   Move to the project directory and execute the following command to install required Flutter dependencies:

   ```bash
   flutter pub get
   ```

3. **Run the App**

   Ensure you have an emulator running or a device connected to your computer. Verify connected devices using:

   ```bash
   flutter devices
   ```

   Then, run the app with the following command:

   ```bash
   flutter run --dart-define=newsAPIKey=NEWS_API_KEY --dart-define=geminiAPIKey=GEMINI_API_KEY
   ```

### How to Use

Provide specific instructions on navigating the app, any login procedures, or key features usage.

### Contribution Guidelines

We encourage contributions to enhance Summarizer. Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

Refer to [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

### License

Summarizer is licensed under the MIT License. Refer to the [LICENSE](LICENSE) file for more information.

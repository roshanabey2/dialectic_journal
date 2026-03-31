RubyLLM.configure do |config|
  config.default_model = "qwen2.5-coder:14b"
  config.openai_api_base = "http://192.168.0.175:11434/v1"
  config.openai_api_key = "ollama" # dummy key
  # Use the new association-based acts_as API (recommended)
  config.use_new_acts_as = true
end

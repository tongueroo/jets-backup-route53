module Main
  class Application < Jets::Application
    config.project_name = "backer"
    config.mode = "job"

    config.prewarm.enable = false # default is true
  end
end

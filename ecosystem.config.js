module.exports = {
    apps: [
        {
            name: 'webhook-service',
            script: 'webhook',
            args: [
                '-port=9000',
                '-hooks=hooks.yaml',
                '-verbose',
            ],
            interpreter: 'bash',
            exec_interpreter: 'none',
            exec_mode: 'fork_mode',
        },
    ],
  }
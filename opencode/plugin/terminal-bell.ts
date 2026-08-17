import type { Plugin } from "@opencode-ai/plugin"

export const TerminalBell: Plugin = async () => {
  const bell = async () => {
    await Bun.write(Bun.stdout, "\x07")
  }

  return {
    event: async ({ event }) => {
      switch (event.type) {
        case "session.idle":
        case "permission.asked":
        case "question.asked":
          await bell()
          break

        case "session.error":
          await bell()
          break
      }
    },
  }
}

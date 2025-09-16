# UMIS Activate (for Cursor Chat)

## What this does
- Print minimal map of the repo (key dirs/files)
- Build or reuse AI bundle for chat
- Echo the exact next sentence to start

## Quick activate (terminal)
```bash
export UMIS_HOME="$(pwd)"
"$UMIS_HOME/build/run_bundle.sh" adaptive cursor_chat
```

## Quick activate (chat)
- Say: "/활성화" or "/activate"
- If no bundle exists, the assistant builds it and replies with readiness + next step.

## Repo map (key)
- build/: bundle & validate
- ui/: chat router/commands/prompts
- profiles/: cursor_chat, quick_sam
- agents/, workflows/, monitoring/, quality/, output/

## Next step
- Say your problem in one sentence, or ask for 탐색/검색 first.

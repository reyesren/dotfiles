GHOSTTY_ID=$(xdotool search --onlyvisible --class ghostty | head -1)

if [ -n "$GHOSTTY_ID" ]; then
    xdotool windowactivate "$GHOSTTY_ID"
else
    ghostty &
fi

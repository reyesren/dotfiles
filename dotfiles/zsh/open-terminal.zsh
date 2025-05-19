KITTY_ID=$(xdotool search --onlyvisible --class kitty | head -1)

if [ -n "$KITTY_ID" ]; then
    xdotool windowactivate "$KITTY_ID"
else
    kitty &
fi

#!/bin/bash

# Create a new tmux session
tmux new-session -d -s postgres

# Send a command to the session
tmux send-keys -t postgres "cd /home/w205/docker/clusters/anaconda_postgres" Enter
tmux send-keys -t postgres "docker-compose up" Enter

# Detach from the session
tmux detach-client -s postgres

echo "pause while postgres comes up."
sleep 2

tmux new-session -d -s jupyter
tmux send-keys -t jupyter "cd /home/w205/docker/clusters/anaconda_postgres" Enter
tmux send-keys -t jupyter "docker-compose exec anaconda jupyter notebook --notebook-dir=/user --ip='*' --port=8888 --no-browser --allow-root" Enter

echo "pause while postgres comes up."
sleep 2

tmux attach-session -t jupyter

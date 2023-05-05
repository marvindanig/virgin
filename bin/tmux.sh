export WORKING_DIR=~/work/virgin
cd $WORKING_DIR; mvim; gitx

tmux start-server
tmux new-session -d -s virgin -n work

tmux new-window -tvirgin:1 -n server
tmux new-window -tvirgin:2 -n guard

tmux send-keys -tvirgin:0 'cd $WORKING_DIR' C-m
tmux send-keys -tvirgin:1 'cd $WORKING_DIR && cd spec/dummy && rails s' C-m
tmux send-keys -tvirgin:2 'cd $WORKING_DIR && bundle exec guard' C-m


tmux select-window -tvirgin:0
tmux attach-session -d -tvirgin

tmux \
	new-session -s 'brooks' -c ~ \; \
	rename-window 'validator' \; \
	send-keys 'tf' C-m \; \
	split-window -v \; \
	send-keys 'systemctl status sol' C-m \; \
	split-window -v \; \
	send-keys 'agave-validator monitor' C-m \; \
	\
	new-window -n 'src' -c ~/src/agave \; \
	send-keys 'ls -alh' C-m \; \
	send-keys 'git status' C-m \; \
	send-keys 'git log --oneline --graph -10' C-m \; \
	\
	new-window -n 'config' -c ~ \; \
	send-keys 'less ~/service-env.sh' C-m \; \
	split-window -h \; \
	send-keys 'less ~/bin/validator.sh' C-m \; \
	\
	new-window -n 'logs' -c ~/logs \; \
	send-keys 'ls -alh' C-m \; \
	\
	new-window -n 'ledger' -c ~/ledger \; \
	send-keys 'ls -alh' C-m \; \
	\
	select-window -t 'validator' \;

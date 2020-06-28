# docker-sshd

This is a dockerfile which runs an ssh daemon.  
It is useful for proxying things from a SLURM job.  
I mainly use it to proxy SSH so I can SFTP into a SLURM node.

* `run.sh` builds and runs the dockerfile.
* `connect.sh` proxys port 22350 to your localhost.
  * It runs `ssh -L 22350:localhost:22350 root@localhost -p 22450`

On your slurm job:
* Run sshd on a free port
** Run `/usr/sbin/sshd -D -f sshd_config` where sshd runs on port 6800
* Proxy sshd over to port 22350 in the docker container
  * Run `ssh -R 22350:localhost:6800 root@192.168.1.55 -p 22450`

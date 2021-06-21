#get your envs files and export envars
export $(egrep  -v '^#'  /run/secrets/* | xargs) 
#call the dockerfile's entrypoint
source /docker-entrypoint.sh

#Vagrant
	Abaixo esta uma relação dos principais comandos para usar cno Vagrant

- vagrant init bento/ubuntu-16.04 // Inicializa o vagrant no diretorio atual 
- vagrant up --provider virtualbox // Cria uma maquina vitual usando o virtualbox 
- vagrant up // Liga a instancia
- vagrant provision // Executa o provision com base no arquivo de configuracao Vagrantfile
- vagrant up --provision // Liga a instancia e Executa o provision
- vagrant ssh // Obtem acesso ssh a instancia


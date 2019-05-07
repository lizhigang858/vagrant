# vagrant
vagrant 是一个虚拟机控制软件
```bash
#创建一个目录，生成一个Vagrantfile
vagrant init
#编辑Vagrantfile配置需要的虚拟机,然后就可以
vagrant up
#进入
vagrant ssh
#停止
vagrant halt
#删除虚拟机
vagrant destroy
```

## vagrant_test
一个测试虚拟机，在Vagrantfile里有详细注释，对配置中的一些概念做了解释


## kcluster
k8s集群，一个master，两个worker，修改自[justmeandopensource的代码](https://github.com/justmeandopensource/kubernetes)
主要是将一些安装该用aliyun的
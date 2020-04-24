#!/bin/bash
sudo yum -y update
sudo yum -y install git wget mc

#coretto JDK JRE
    sudo wget https://d1f2yzg3dx5xke.cloudfront.net/java-1.8.0-amazon-corretto-devel-1.8.0_202.b08-1.amzn2.x86_64.rpm
    sudo wget https://d1f2yzg3dx5xke.cloudfront.net/java-1.8.0-amazon-corretto-1.8.0_202.b08-1.amzn2.x86_64.rpm
    sudo yum -y localinstall java-1.8.0-amazon-corretto*.rpm

    #sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
    #sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
    #sudo yum -y install fontconfig
    #sudo yum -y upgrade && sudo yum -y install jenkins java
    #sudo systemctl start jenkins
    #sudo systemctl enable jenkins
    #sudo chkconfig jenkins on
mkdir spring
cd spring
mkdir -p src/main/java/hello
cd src
cd main
cd java
cd hello
sudo touch HelloWorld.java
sudo touch Greeter.java
cat <<EOF | sudo tee -a ~/spring/src/main/java/hello/HelloWorld.java
        
package hello;

public class HelloWorld {
    public static void main(String[] args) {
        Greeter greeter = new Greeter();
        System.out.println(greeter.sayHello());
    }
}
EOF

sudo touch Greeter.java
cat <<EOF | sudo tee -a ~/spring/src/main/java/hello/Greeter.java
        
package hello;

public class Greeter {
    public String sayHello() {
        return "Hello world!";
    }
}
EOF
    

    #sudo mkdir /opt/maven

    #wget https://apache.volia.net/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
    #sudo tar xzvf apache-maven-3.6.0-bin.tar.gz -C /opt/maven
    #sudo yum -y install maven
    #setup the environment variables
    #sudo sh -c "echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.212.b04-0.el7_6.x86_64/jre' >> /etc/profile.d/maven.sh"
    #sudo sh -c "echo 'export M2_HOME=/opt/maven/apache-maven-3.6.0' >> /etc/profile.d/maven.sh"
    #sudo sh -c "echo 'export MAVEN_HOME=/opt/maven/apache-maven-3.6.0' >> /etc/profile.d/maven.sh"
    #sudo sh -c "echo 'PATH=${M2_HOME}/bin:${PATH}' >> /etc/profile.d/maven.sh"
/java-1.8.0-openjdk-1.8.0.212.b04-0.el7_6.x86_64
    #sudo chmod +x /etc/profile.d/maven.sh
    #load the environment variables by typing
    #source /etc/profile.d/maven.sh

cd ~/spring
sudo touch pom.xml 
sudo cat <<EOF | sudo tee -a ~/spring/pom.xml
        
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>org.springframework</groupId>
    <artifactId>gs-maven</artifactId>
    <packaging>jar</packaging>
    <version>0.1.0</version>

    <properties>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
    </properties>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-shade-plugin</artifactId>
                <version>2.1</version>
                <executions>
                    <execution>
                        <phase>package</phase>
                        <goals>
                            <goal>shade</goal>
                        </goals>
                        <configuration>
                            <transformers>
                                <transformer
                                    implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                                    <mainClass>hello.HelloWorld</mainClass>
                                </transformer>
                            </transformers>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
</project>
EOF


    
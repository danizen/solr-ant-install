# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export SOLR_INCLUDE="{{solr.server.dir}}/nlm-solr-env.sh"
export SOLR_INSTALL_DIR="{{install.dir}}/current"
export JAVA_HOME="{{solr.java.home}}"
export ANT_HOME=/usr/nlm/share/ant

PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH:$HOME/bin:$SOLR_INSTALL_DIR/bin

export PATH

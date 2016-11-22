require 'pg'
require 'load_config'

module DBConfig
  def DBConfig.con

    config = DBConfig.config_setup
    PG.connect(
        :user => config[:db_user],
        :password => config[:db_password],
        :host => config[:db_host],
        :port => config[:db_port],
        :dbname => config[:db_name]
    )
  end

  def DBConfig.config_setup
    db = ENV['DATABASE_URL']
    db = `#{db}`
    db = db.scan(/(\/.+?:)(.+?@)(.+?:)(.+?\/)(.+)/)
    configs = {
        :db_user => db[0][0].tr("//:", ""),
        :db_password => db[0][1].tr("@", ""),
        :db_host => db[0][2].tr(":", ""),
        :db_port => db[0][3].tr("/", ""),
        :db_name => db[0][4]
    }
    configs
  end
end

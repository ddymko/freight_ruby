class DBData

  @conn

  def initialize(conn)
    @conn = conn
  end

  def user_configs(id)
    begin
      @conn.prepare 'stm1', 'SELECT TRAIN_LINE, TRAIN_NUMBER FROM COMMUTES WHERE ID =$1 '
      rs = @conn.exec_prepared 'stm1', [id]

    rescue PG::Error => e
      puts e.message

    ensure
      return rs.values[0]
    end
  end

  def user_number(id)
    begin
      @conn.prepare 'stm2', 'SELECT PHONE_NUMBER FROM USERS WHERE ID =$1 '
      rs = @conn.exec_prepared 'stm2', [id]

    rescue PG::Error => e
      puts e.message

    ensure
      @conn.close
      return rs.values[0]
    end
  end

end
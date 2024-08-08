class Api::V1::ProductsController < ApplicationController
  def index
    begin
      @products = Product.all
      render json: @products
    rescue => error
      case error.error_number
      when ER_BAD_DB_ERROR
        raise ActiveRecord::NoDatabaseError.db_error(config[:database])
      when ER_DBACCESS_DENIED_ERROR, ER_ACCESS_DENIED_ERROR
        raise ActiveRecord::DatabaseConnectionError.username_error(config[:username])
      when ER_CONN_HOST_ERROR, ER_UNKNOWN_HOST_ERROR
        raise ActiveRecord::DatabaseConnectionError.host_error(config[:host])
      else
        raise error # その他のエラーはそのまま再度発生させる
      end
    end
  end
end

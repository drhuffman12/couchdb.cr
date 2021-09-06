require "./couchdb/version"
require "./couchdb/client"
require "./couchdb/database"
require "./couchdb/response"
require "./couchdb/find_query"
require "json_mapping"

module CouchDB

  macro mapping(**properties)

    JSON.mapping(
      _id: String?,
      _rev: String?,
      {{**properties}}
    )
  end

end

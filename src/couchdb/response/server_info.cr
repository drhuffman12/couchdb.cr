require "json"

module CouchDB::Response
  
  class Vendor
    include JSON::Serializable
    property name : String

    # property version : String
    # NOTE: Above commented out (for now).
    # TODO: Why "CouchDB::Response::Vendor#version" not getting parsed in?
    #   WORK-AROUND: Use 'ServerInfo#version' instead of 'Vendor#version'.
    #   ERROR: "JSON::SerializableError"
    #     Missing JSON attribute: version
    #     parsing CouchDB::Response::Vendor at line 1, column 205
    #     parsing CouchDB::Response::ServerInfo#vendor at line 1, column 196 (JSON::SerializableError)
    #     from /.../crystal/1.0.0/share/crystal/src/json/serialization.cr:159:7 in 'initialize:__pull_for_json_serializable'
    #     from src/couchdb/response/server_info.cr:12:5 in 'new_from_json_pull_parser'
    #     from src/couchdb/response/server_info.cr:12:5 in 'new'
    #     from /.../crystal/1.0.0/share/crystal/src/json/from_json.cr:13:3 in 'from_json'
    #     from src/couchdb/client.cr:50:18 in 'server_info'
    #     from spec/couchdb_spec.cr:19:7 in '->'
    #     ...
    #     from __libc_start_main
    #     from _start
    #     from ???
  end

  class ServerInfo
    include JSON::Serializable
    property couchdb : String
    property uuid : String
    property version : String
    property vendor : Vendor
  end
end

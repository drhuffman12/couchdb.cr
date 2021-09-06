require "json"

module CouchDB::Response
  
  class Vendor
    include JSON::Serializable
    property name : String

    # property version : String
    @[Deprecated("Use `ServerInfo#version` instead of `Vendor#version`.")]
    def version
    end
  end

  class ServerInfo
    include JSON::Serializable
    property couchdb : String
    property uuid : String
    property version : String
    property vendor : Vendor

    def is_v2?
      !(/^2\.\d+\.\d+$/.match(version).nil?)
    end

    def is_v3?
      !(/^3\.\d+\.\d+$/.match(version).nil?)
    end
  end
end

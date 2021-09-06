require "json"
require "spec"
require "../src/couchdb"

def new_client : CouchDB::Client
  un = ENV.keys.includes?("TEST_DB_UN") ? ENV["TEST_DB_UN"] : "admin"
  pw = ENV.keys.includes?("TEST_DB_PW") ? ENV["TEST_DB_PW"] : "password"
  ip = ENV.keys.includes?("TEST_DB_IP") ? ENV["TEST_DB_IP"] : "localhost"
  port = ENV.keys.includes?("TEST_DB_PORT") ? ENV["TEST_DB_PORT"] : "5984"
  couchdb_url = ENV.keys.includes?("TEST_DB") ? ENV["TEST_DB"] : "http://#{un}:#{pw}@#{ip}:#{port}"

  CouchDB::Client.new couchdb_url
end

TEST_DB = CouchDB::Database.new new_client, "test_db"

class TestObject
  CouchDB.mapping(
    name: String,
    int: Int32
  )

  def initialize(@name, @int)
  end
end

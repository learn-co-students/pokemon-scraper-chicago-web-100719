class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon (name, type) values (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon =  db.execute("Select * from pokemon where id = ?", id).flatten
        self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    end
end

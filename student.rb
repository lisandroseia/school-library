require_relative = "Person"

class student < Person

    def initialize(classroom, age, name = "unknown", parent_permission: true)
        super(age, name = "unknown", parent_permission: parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end
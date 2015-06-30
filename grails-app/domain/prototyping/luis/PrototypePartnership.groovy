package prototyping.luis

class PrototypePartnership {
    String name
    String institute

    static hasMany = [activities:PrototypeActivity]
    static constraints = {
    }
}

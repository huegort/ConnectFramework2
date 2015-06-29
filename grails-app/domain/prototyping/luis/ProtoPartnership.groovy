package prototyping.luis

class ProtoPartnership {
    String name
    String institute

    static hasMany = [activities:ProtoActivity]
    static constraints = {
    }
}

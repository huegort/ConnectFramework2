package prototyping.luis

class PrototypeActivity {
    String name
    String description

    static belongsTo = [partner:PrototypePartnership]
    static constraints = {
    }
}

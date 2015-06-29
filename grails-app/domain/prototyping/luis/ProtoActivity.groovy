package prototyping.luis

class ProtoActivity {
    String name
    String description

    static belongsTo = [partner:ProtoPartnership]
    static constraints = {
    }
}

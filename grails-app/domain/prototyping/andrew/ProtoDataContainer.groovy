package prototyping.andrew

class ProtoDataContainer {

    static hasMany = [setOfData : ProtoCriteriaData]
    static mapping = {
        setOfData column: 'container_id'
    }
    static constraints = {
    }
}

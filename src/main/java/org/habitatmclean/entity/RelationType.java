package org.habitatmclean.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="relation_type")
@AttributeOverride(name="id", column = @Column(name="relation_id"))
public class RelationType extends GenericEntity implements Serializable {

    private String relation_name;
    private String relation_desc;

    public RelationType() { }

    public RelationType(Long id, String relation_name, String relation_desc) {
        this.id = id;
        this.relation_name = relation_name;
        this.relation_desc = relation_desc;
    }

    public RelationType(String relation_name, String relation_desc) {
        this.relation_name = relation_name;
        this.relation_desc = relation_desc;
    }

    @Column(name="relation_name")
    public String getRelation_name() {
        return relation_name;
    }

    public void setRelation_name(String relation_name) {
        this.relation_name = relation_name;
    }

    @Column(name="relation_desc")
    public String getRelation_desc() {
        return relation_desc;
    }

    public void setRelation_desc(String relation_desc) {
        this.relation_desc = relation_desc;
    }

}

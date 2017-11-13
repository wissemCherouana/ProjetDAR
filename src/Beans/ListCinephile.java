package Beans;

import java.io.Serializable; 
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="LIST")
public class ListCinephile implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="LIST_ID")
	private int list_id; 
	@Column(name="LIST_NAME")
	private String list_name; 
	@Enumerated(EnumType.ORDINAL)
	private TypeList list_type;
	@ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
        name = "LIST_ELEMENT", 
        joinColumns = { @JoinColumn(name = "LIST_ID") }, 
        inverseJoinColumns = { @JoinColumn(name = "ELEMENT_ID") }
    )
	private List<Element> elements;
	@ManyToOne(optional = false)
	@JoinColumn(name = "CINEPHILE_ID")
	private Cinephile cinephile; 
	
	public ListCinephile() {
		
	}
	
	public ListCinephile(String list_name, TypeList list_type) {
		super();
		this.list_name = list_name;
		this.list_type = list_type;
	}

	public String getList_name() {
		return list_name;
	}

	public TypeList getList_type() {
		return list_type;
	}

	public List<Element> getElements() {
		return elements;
	}

	public Cinephile getCinephile() {
		return cinephile;
	}

	public void setList_name(String list_name) {
		this.list_name = list_name;
	}

	public void setList_type(TypeList list_type) {
		this.list_type = list_type;
	}

	public void setElements(List<Element> elements) {
		this.elements = elements;
	}

	public void setCinephile(Cinephile cinephile) {
		this.cinephile = cinephile;
	}
	
	
	
	
	

}

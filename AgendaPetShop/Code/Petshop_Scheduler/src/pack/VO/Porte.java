package pack.VO;

public class Porte 
{
	private int id;
	private String descricao;
	
	public int getId() { return this.id; }
	public void setId(int id) { this.id = id; }
	   
	public String getDescricao() { return this.descricao; }
	public void setDescricao(String descricao) { this.descricao = descricao; }
	
	@Override
	public String toString() 
	{
	    return this.getDescricao();
	}
}

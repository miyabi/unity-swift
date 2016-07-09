using UnityEngine;
using System.Collections;

public class CubeGenerator : MonoBehaviour {

	[SerializeField] private GameObject cubePrefab;
	[SerializeField] private float generateInterval;
	private float lastGeneratedTime;

	// Use this for initialization
	void Start () {
	
		Generate();
	}
	
	// Update is called once per frame
	void Update () {
	
		if(Time.time - lastGeneratedTime >= generateInterval)
		{
			Generate();
		}
	}

	public void Generate()
	{
		GameObject obj = Instantiate(cubePrefab) as GameObject;
		obj.transform.parent = transform;
		obj.transform.localScale = cubePrefab.transform.localScale;
		obj.transform.position = transform.position;
		obj.transform.rotation = Random.rotation;

		lastGeneratedTime = Time.time;
	}
}

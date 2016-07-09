using UnityEngine;
using System.Collections;

public class Cube : MonoBehaviour {

	[SerializeField] private float minimumY;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
		if(transform.localPosition.y < minimumY)
		{
			Destroy(gameObject);
		}
	}
}

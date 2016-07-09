using UnityEngine;
using System.Collections;

public class Rotator : MonoBehaviour {

	[SerializeField] private float rotationSpeed;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
		float angle = transform.localEulerAngles.y + rotationSpeed * Time.deltaTime;
		if(angle > 360.0f)
		{
			angle -= 360.0f;
		}
		transform.localEulerAngles = new Vector3(
			transform.localEulerAngles.x, 
			transform.localEulerAngles.y + rotationSpeed * Time.deltaTime, 
			transform.localEulerAngles.z
		);
	}
}

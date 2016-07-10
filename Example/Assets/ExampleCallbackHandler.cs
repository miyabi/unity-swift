using UnityEngine;
using System.Collections;

public class ExampleCallbackHandler : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    public void OnCallFromSwift(string message) {
    	Debug.Log("OnCallFromSwift is called with message: "  + message);
    }
}

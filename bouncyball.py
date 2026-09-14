import argparse

def main():
    bouncing_choices = {
        "toss": "bounced once",
        "throw": "bounced twice",
        "chuck": "bounced thrice"
    }

    

    parser = argparse.ArgumentParser(description="Throwing a bouncy ball.")
    parser.add_argument(

        "action", 

        choices=list(bouncing_choices.keys()), 

        help="How hard are we going to throw the ball?"
    )

    
    
    args = parser.parse_args()

    

    result = bouncing_choices[args.action]


    print(f"You {args.action}ed the ball, and it {result}! Look at that thing go!")


if __name__ == "__main__":
    main()

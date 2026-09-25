# Initial account balance
balance = 5000.00


# Function to check balance
def check_balance():
    print("\n===== BALANCE =====")
    print(f"Available Balance: ₹{balance:.2f}")


# Function to deposit money
def deposit():
    global balance

    print("\n===== DEPOSIT =====")

    try:
        amount = float(input("Enter deposit amount: "))

        if amount <= 0:
            raise ValueError("Amount must be greater than zero.")

        balance += amount

        print(f"₹{amount:.2f} deposited successfully.")
        print(f"New Balance: ₹{balance:.2f}")

    except ValueError as error:
        print("Invalid amount:", error)


# Function to withdraw money
def withdraw():
    global balance

    print("\n===== WITHDRAW =====")

    try:
        amount = float(input("Enter withdrawal amount: "))

        if amount <= 0:
            raise ValueError("Amount must be greater than zero.")

        if amount > balance:
            raise ValueError("Insufficient balance.")

        balance -= amount

        print(f"₹{amount:.2f} withdrawn successfully.")
        print(f"Remaining Balance: ₹{balance:.2f}")

    except ValueError as error:
        print("Transaction failed:", error)


# Main ATM menu
def main():

    while True:

        print("\n==========================")
        print("       ATM SYSTEM")
        print("==========================")
        print("1. Check Balance")
        print("2. Deposit")
        print("3. Withdraw")
        print("4. Exit")
        print("==========================")

        choice = input("Enter your choice: ")

        if choice == "1":
            check_balance()

        elif choice == "2":
            deposit()

        elif choice == "3":
            withdraw()

        elif choice == "4":
            print("\nThank you for using the ATM.")
            print("Have a nice day!")
            break

        else:
            print("Invalid choice. Please try again.")


# Start the program
if __name__ == "__main__":
    main()


EXPECTED OUTPUT
==========================
       ATM SYSTEM
==========================
1. Check Balance
2. Deposit
3. Withdraw
4. Exit
==========================

Enter your choice: 1

===== BALANCE =====
Available Balance: ₹5000.00

Enter your choice: 2

===== DEPOSIT =====
Enter deposit amount: 2000
₹2000.00 deposited successfully.
New Balance: ₹7000.00

Enter your choice: 3

===== WITHDRAW =====
Enter withdrawal amount: 1500
₹1500.00 withdrawn successfully.
Remaining Balance: ₹5500.00

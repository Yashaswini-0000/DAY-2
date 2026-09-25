FILE_NAME = "expenses.txt"


def add_expense():
    print("\n===== ADD EXPENSE =====")

    date = input("Enter date (DD-MM-YYYY): ")
    category = input("Enter category: ")
    description = input("Enter description: ")

    try:
        amount = float(input("Enter amount: "))

        if amount <= 0:
            raise ValueError("Amount must be greater than 0.")

        with open(FILE_NAME, "a") as file:
            file.write(
                f"{date},{category},{description},{amount:.2f}\n"
            )

        print("Expense added successfully!")

    except ValueError as error:
        print("Invalid input:", error)


def view_expenses():
    print("\n===== ALL EXPENSES =====")

    try:
        with open(FILE_NAME, "r") as file:
            expenses = file.readlines()

        if not expenses:
            print("No expenses found.")
            return

        for expense in expenses:
            date, category, description, amount = expense.strip().split(",")

            print("Date:", date)
            print("Category:", category)
            print("Description:", description)
            print("Amount: ₹", amount)
            print("------------------------")

    except FileNotFoundError:
        print("No expense file found.")


def search_by_category():
    print("\n===== SEARCH BY CATEGORY =====")

    search_category = input("Enter category: ").strip().lower()
    found = False

    try:
        with open(FILE_NAME, "r") as file:
            for expense in file:
                date, category, description, amount = expense.strip().split(",")

                if category.lower() == search_category:
                    print(
                        f"{date} | {category} | "
                        f"{description} | ₹{amount}"
                    )
                    found = True

        if not found:
            print("No expenses found for this category.")

    except FileNotFoundError:
        print("No expense file found.")


def calculate_total():
    print("\n===== TOTAL EXPENSE =====")

    total = 0

    try:
        with open(FILE_NAME, "r") as file:
            for expense in file:
                data = expense.strip().split(",")
                amount = float(data[3])
                total += amount

        print(f"Total Expense: ₹{total:.2f}")

    except FileNotFoundError:
        print("No expense file found.")


def main():
    while True:
        print("\n===== MINI EXPENSE TRACKER =====")
        print("1. Add Expense")
        print("2. View All Expenses")
        print("3. Search by Category")
        print("4. Calculate Total Expense")
        print("5. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            add_expense()

        elif choice == "2":
            view_expenses()

        elif choice == "3":
            search_by_category()

        elif choice == "4":
            calculate_total()

        elif choice == "5":
            print("Thank you for using Expense Tracker!")
            break

        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    main()

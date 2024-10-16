class OuterClass:
    def __init__(self, outer_value):
        self.outer_value = outer_value

    def display_outer(self):
        print(f"Outer Value: {self.outer_value}")

    class InnerClass:
        def __init__(self, inner_value):
            self.inner_value = inner_value

        def display_inner(self):
            print(f"Inner Value: {self.inner_value}")

outer_instance = OuterClass("Outer Value Example")
outer_instance.display_outer() 
inner_instance = OuterClass.InnerClass("Inner Value Example")
inner_instance.display_inner() 
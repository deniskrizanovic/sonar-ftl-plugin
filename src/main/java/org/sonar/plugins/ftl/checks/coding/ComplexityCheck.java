/*
 * Sonar Web Plugin
 * Copyright (C) 2010 Matthijs Galesloot
 * dev@sonar.codehaus.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sonar.plugins.ftl.checks.coding;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.sonar.api.measures.CoreMetrics;
import org.sonar.check.Priority;
import org.sonar.check.Rule;
import org.sonar.check.RuleProperty;
import org.sonar.plugins.ftl.checks.AbstractPageCheck;
import org.sonar.plugins.ftl.node.Attribute;
import org.sonar.plugins.ftl.node.TagNode;
import org.sonar.plugins.ftl.visitor.FtlSourceCode;

/**
 * Checks cyclomatic complexity against a specified limit. The complexity is measured by counting decision tags (such as if and forEach) and
 * boolean operators in expressions ("&amp;&amp;" and "||"), plus one for the body of the document. It is a measure of the minimum number of
 * possible paths to render the page.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
@Rule(key = "ComplexityCheck", priority = Priority.MINOR)
public final class ComplexityCheck extends AbstractPageCheck {

    private static final int DEFAULT_MAX_COMPLEXITY = 10;

    private int complexity;

    @RuleProperty
    private int max = DEFAULT_MAX_COMPLEXITY;

    @RuleProperty
    private String[] operators = new String[]{"&&", "||", "and", "or"};

    @RuleProperty
    private String[] tags = new String[]{"?", "catch", "choose", "if", "forEach", "forTokens", "when"};

    @Override
    public void endDocument() {
        super.endDocument();

        if (complexity > max) {
            String msg = String.format("Complexity is %d (max allowed is %d)", complexity, max);
            createViolation(0, msg);
        }

        getFtlSourceCode().addMeasure(CoreMetrics.COMPLEXITY, complexity);
    }

    public int getMax() {
        return max;
    }

    public String getOperators() {
        return StringUtils.join(operators, ",");
    }

    public String getTags() {
        return StringUtils.join(tags, ",");
    }

    public void setMax(int max) {
        this.max = max;
    }

    public void setOperators(String value) {
        this.operators = trimSplitCommaSeparatedList(value);
    }

    public void setTags(String value) {
        this.tags = trimSplitCommaSeparatedList(value);
    }

    @Override
    public void startDocument(FtlSourceCode ftlSourceCode) {
        super.startDocument(ftlSourceCode);
        complexity = 1;
    }

    @Override
    public void startElement(TagNode node) {

        if (ArrayUtils.contains(tags, node.getLocalName()) || ArrayUtils.contains(tags, node.getNodeName())) {
            complexity++;
            countComplexityInExpression(node);
        } else {
            // count complexity in expressions I'm not sure I ever get in here.
            countComplexityInExpression(node);
        }
    }

    private void countComplexityInExpression(TagNode node) {
        for (Attribute a : node.getAttributes()) {

            //I know my operators will always be in the name of the attribute
            if (ArrayUtils.contains(operators, a.getName())) {
                complexity++;
            }
        }
    }
}
